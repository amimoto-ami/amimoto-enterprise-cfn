MySQLPassword do
  Description "Password of RDS User"
  Type        "String"
  MinLength   8
  MaxLength   64
end

MulitiAZDatabase do
  Description           "Crate a Multi-AZ RDS Database Instance"
  Default               true
  Type                  "String"
  AllowedValues         "true","false"
  ConstraintDescription "must be either true or false"
end
