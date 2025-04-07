resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "sshkeypair" {
  key_name   = "SSH-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "local_file" "ssh-key" {
  content  = tls_private_key.ssh_key.private_key_pem
  filename = "ssh-key-pair.pem"
}


output "key_name" {
  value = aws_key_pair.sshkeypair.key_name
}