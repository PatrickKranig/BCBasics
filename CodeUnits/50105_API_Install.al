codeunit 50105 API_Install
{
    // Set the codeunit to be an install codeunit. 
    Subtype = Install; //eine installationsCodeUnit  aufzurufen ist redundant, da die unit eh mit jeder veröffentlichung immer getriggert wird und losläuft

    // This trigger includes code for company-related operations. 
    trigger OnInstallAppPerCompany();
    var//variable (für datensatz) deklarieren)
        Reward: Record MyOwnTable; //Datensatz (LOKAL) deklarieren auf basis der tabelle
    begin
        // If the Owntable is empty, insert the default Data.
        if Reward.IsEmpty()
            then begin
            InsertDefaultData();//aufruf und übergabe an funktion unten...
        end;
    end;


    procedure InsertDefaultData();// Insert the GOLD, SILVER, BRONZE reward levels
    begin
        InsertRewardLevel('1', 'Text1', 20);//aufruf und übergabe an funktion unten...
        InsertRewardLevel('2', 'Text2', 10);//aufruf und übergabe an funktion unten...
        InsertRewardLevel('3', 'Text3', 5);//aufruf und übergabe an funktion unten...
    end;


    procedure InsertRewardLevel(ID: Code[30]; Description: Text[250]; Discount: Decimal); // Create and insert
    var
        Reward: Record MyOwnTable;//Datensatz (LOKAL) deklarieren auf basis der tabelle
    begin
        Reward.Init();
        Reward.Feld1_table_ID := ID;
        Reward.Feld2_table := Description;
        Reward.Feld3_table := Discount;
        Reward.Insert();
    end;

}