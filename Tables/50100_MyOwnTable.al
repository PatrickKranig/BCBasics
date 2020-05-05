table 50100 MyOwnTable //tabellen sind hidden!
{
    DataClassification = ToBeClassified;

    fields
    {
        // of the reward and can contain up to 30 Code characters. 
        field(1; "Feld1_table_ID"; Code[30])// The "ID" field represents the unique identifier 
        {
            DataClassification = ToBeClassified;
        }

        field(2; Feld2_table; Text[250]) // "" ist mit unterstrichnamen redundant
        { // string field
            // This property specified that             
            NotBlank = true;// this field cannot be left empty. (also NULL)
            //zum befüllen mit daten, eine referenz einer codeunit verwenden . https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/properties/devenv-subtype-codeunit-property
            //aber sie muss als Subtype = Install; gesetzt sein https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-extension-example
            //eine installationsCodeUnit hier aufzurufen ist redundant, da die unit eh mit jeder veröffentlichung immer getriggert wird und losläuft
        }

        // that represents the discount that will 
        // be applied for this reward.
        field(3; Feld3_table; Decimal)// "" ist mit unterstrichnamen redundant
        {
            MinValue = 0; // The "MinValue" property sets the minimum value for the Decimal field           
            MaxValue = 100;// The "MaxValue" property sets the maximum value for the Decimal field.            
            DecimalPlaces = 2;// The "DecimalPlaces" property is set to 2 to display discount values with exactly 2 decimals.
        }
    }

    keys
    {
        key(PK; "Feld1_table_ID")// The field "Reward ID" is used as the primary key of this table.  
        {
            // Create a clustered index from this key.
            Clustered = true;
        }
    }
}