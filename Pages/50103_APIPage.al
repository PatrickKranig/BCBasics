page 50103 "API_test Page Card"
{
    PageType = Card;
    SourceTable = API_test_table; //table auf der die page basiert
    Editable = true;
    UsageCategory = Tasks;// The page will be part of the "Tasks" group of search results. - https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-al-menusuite-functionality   

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Symbol; Symbol)
                {
                    ApplicationArea = All;
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
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
                ApplicationArea = All;
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

    trigger OnOpenPage();
    var
    begin

    end;

    var
        myInt: Integer;


}