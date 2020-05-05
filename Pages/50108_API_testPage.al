page 50108 "API_test Page"
{
    PageType = List;
    SourceTable = API_test_table; //tabelle auf den die page basiert
    Editable = true;
    CardPageId = 50103;

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
                Image = Import;
                Visible = true;
                Enabled = true;
                trigger OnAction();
                var
                    StockSelectedRecs: Record API_test_table; //Datensatzvariable
                    HttpStockImport: Codeunit HttpStockDataImportMgt_API;
                begin
                    CurrPage.SetSelectionFilter(StockSelectedRecs);

                    IF StockSelectedRecs.FindSet() then
                        repeat
                            HttpStockImport.ImportStockData(StockSelectedRecs.Symbol);
                        until StockSelectedRecs.Next() = 0;

                    Message('Import Completed');
                end;
            }
        }

        area(Navigation)
        {
            action(ShowStockPrices)
            {
                ApplicationArea = All;
                RunObject = page API_testList;
                RunPageLink = Symbol = FIELD(Symbol);
                Image = ShowList;
                Visible = true;
                Enabled = true;
            }
        }
    }
}