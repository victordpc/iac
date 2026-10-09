provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      Proyecto = "ucm-victor-delpino"
      Alumno = "victor.delpino@bluetab.net"
    }
  }
}
