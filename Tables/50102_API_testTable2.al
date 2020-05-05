table 50102 API_test_table2//tabellen sind hidden!
{

    fields
    {
        field(1; Symbol; Code[10])
        {
            TableRelation = API_test_table.Symbol;
        }
        field(2; Date; Date) { }
        field(5; ClosingPrice; Decimal) { }
    }

    keys
    {
        key(PK; Symbol, Date)
        {
            Clustered = true;
        }
    }

    //variablen kann man hier mit var theoretisch auch deklarieren wie in pages und so ... wir brauchen die ABER jetzt nicht wirklich..
}
