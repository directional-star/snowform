terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.76"
    }
  }
}

provider "snowflake" {
  role = "SYSADMIN"
}

resource "snowflake_database" "db" {
  name = "SNOWFORM_DEMO"
}

resource "snowflake_warehouse" "warehouse" {
  name           = "SNOWFORM_DEMO"
  warehouse_size = "small"
  auto_suspend   = 60
}
