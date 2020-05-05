//nach der erstellung des Codes ist Pat_AL_BASOCS_1.0.0.0.app die compilierte extension für den customer
// MSDOKU BASICS https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-get-started

//HIER BEGINNT ALLES!!!!!!!
pageextension 50101 CustomerPageExt extends "Customer List" // snippet tpage - wenn hier fehler- download symbols (siehe gDrive anleitung in launch.json)
{ //https://www.archerpoint.com/blog/Posts/customizing-microsoft-dynamics-business-central-premises-using-al-code-functions
    layout // Add changes to page layout here
    { }
    actions
    { // Add changes to page actions here also extra buttons oder so mit der DEMO Insert/Delete      
        addafter("&Customer") //zu finden ist diese grafische erweiterung rechts oben -> Navigieren -> ...
        {
            action(InsertDemo)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    mycodeunit_INSERT.Run();
                end;
            }
            action(DeleteDemo)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    mycodeunit_DELETE.Run();
                end;
            }
        }
    }

    var // Globale variablen deklarieren...    
        myText: Text; //deklariert eine leere globale variable vom Typ Text - ZUWEISUNG HIER NET MÖGLICH!
        mycodeunit_INSERT: Codeunit Customer_Insert; //deklariert eine variable vom typ einer Codeunit mit gleichzeitigen Verweis auf dessen name
        mycodeunit_DELETE: Codeunit CusstomerDelete;//deklariert eine variable vom typ einer Codeunit mit gleichzeitigen Verweis auf dessen name        

    trigger OnOpenPage();
    var// Lokale variablen NUR Für den trigger deklarieren...
        mycodeunit: Codeunit TestCodeUnit_Basics; //deklariert eine lokale variable vom Typ Codeunit und verweist auf die TestCodunit die wir geschrieben haben
        Parameternumber1: Integer;
        Parameternumber2: Integer;

        APICodeUnit: Codeunit HttpStockDataImportMgt_API; // test einer GET Abfrage und reinschmiss in tabelle
    begin
        myText := 'HalloWelt'; //zuweisung der variable immer hier!
        Message(myText); //schmeisse messageBox

        mycodeunit.Run(); //ruft den RUN Trigger der Codeunit auf
        mycodeunit.MyMethode(); //ruft eine methode der codeunit aus

        Parameternumber1 := 1;
        Parameternumber2 := 2;
        mycodeunit.Rechne(Parameternumber1, Parameternumber2);

        APICodeUnit.ImportStockData('MSFT'); //ausführung der API CodeUnit zum getten
    end;

} // die fertigen erweiterungen sind übrigens in extensions managment in BC, mit dem ihr den code herunterladen/hochlDEN KÖNNT ODER LÖSCHEN UND SO