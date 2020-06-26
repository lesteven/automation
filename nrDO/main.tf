
provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_ssh_key" "ssh_key" {
  name = "digital key"
  public_key = file("~/.ssh/${var.ssh_pubkey}")
}

resource "digitalocean_droplet" "server" {
  image = "ubuntu-20-04-x64"
  name = "server"
  region = "sfo2"
  size = "s-1vcpu-1gb"
  ipv6 = true
  ssh_keys = ["${digitalocean_ssh_key.ssh_key.fingerprint}"]

  provisioner "local-exec" {
    command = "echo ${digitalocean_droplet.server.ipv4_address} > ./scripts/ip.txt"
  }

  provisioner "file" {
    source = "./scripts"
    destination = "./"
  }

  provisioner "remote-exec" {
    inline = [
      "git clone ${var.repo}",
      "chmod +x ./scripts/createSite.sh",
      "sudo ./scripts/createSite.sh",
    ]
  }

  connection {
    type = "ssh"
    host = self.ipv4_address
    user = "root"
    private_key = file("~/.ssh/${var.ssh_privkey}")
  }
}

# output
output "ip" {
  value = "${digitalocean_droplet.server.ipv4_address}"
  description = "Droplet IP"
}
