table 50101 API_test_table//tabellen sind hidden!
{

    fields
    {
        field(1; Symbol; Code[10]) { }
        field(5; Name; Text[250]) { }
        field(7; Description; Text[250]) { }
        field(10; LatestPrice; Decimal)
        {
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(PK; Symbol)
        {
            Clustered = true;
        }
    }
    //variablen kann man hier mit var theoretisch auch deklarieren wie in pages und so ... wir brauchen die ABER jetzt nicht wirklich..
}