# Please use terraform v12.29 to start with for all labs, I will use terraform v13 and v14 from lab 7.5 onwards

resource_group_name  = "Terra-rg"
storage_account_name = "remotesaprimera01" #"remotesa01"
container_name       = "tfstate" #creado manualmente en portal
key                  = "Lab5.tfstate"