page 50101 API_testList
{
    PageType = List;
    SourceTable = API_test_table2; //tabelle auf den die liste basiert
    Editable = false;
    UsageCategory = Lists; // The page will be part of the "Lists" group of search results. - https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-al-menusuite-functionality     

    /* // der code würde bei aufruf die codeunit triggern und mit daten über die APPI befüllen
    trigger OnOpenPage();
    var// Lokale variablen NUR Für den trigger deklarieren...
        APICodeUnit: Codeunit HttpStockDataImportMgt; // test einer GET Abfrage und reinschmiss in tabelle
    begin
        APICodeUnit.ImportStockData('MSFT'); //ausführung der API CodeUnit zum getten
    end;
    */

    layout
    {
        area(content)
        {
            repeater(Stocks)
            {
                field(Symbol; Symbol)
                {
                    ApplicationArea = All;
                }
                field(Date; Date)
                {
                    ApplicationArea = All;
                }
                field(ClosingPrice; ClosingPrice)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ImportStockData)
            {
                RunObject = codeunit HttpStockDataImportMgt_API;
                Image = Import;
                Visible = true;
                Enabled = true;
                trigger OnAction();
                begin
                end;
            }
        }
    }
}