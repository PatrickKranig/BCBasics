codeunit 50107 HttpStockDataImportMgt_API // https://andreilungu.com/use-rest-web-service-import-to-business-central/
{
    /* redundant?
    trigger OnRun();
    begin
    end;

    var
    */

    procedure ImportStockData(Symbol: Code[10]);
    var
        Client: HttpClient;
        ResponseMessage: HttpResponseMessage;
        RString: Text;
        Url: Text;
        APiKey: Text;
        JToken: JsonToken;
        JTokenRates: JsonToken;
        TimeSeries: JsonToken;
        JsonObject: JsonObject;
        JsonObjectRates: JsonObject;
        ListOfDates: List of [Text];
        DateText: TExt;
        ClosingPrice: Decimal;
        DateOfRate: Date;
        LatestDateAlreadyInDatabase: Date;
    begin
        Message('Ich laufe jetzt los und hole die API Datensätze für die StockList!!');
        APiKey := '5HDZU01FUQGU13O1';
        //API Key habe ich mir am 15.4 kostenlos geholt
        Url := 'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=' +
             Symbol + '&apikey=' + ApiKey;

        Client.Get(Url, ResponseMessage);

        If not ResponseMessage.IsSuccessStatusCode() then
            Error('Web service returned error:\\' +
                'Status code: %1\' +
                'Description: %2',
                ResponseMessage.HttpStatusCode(),
                ResponseMessage.ReasonPhrase());
        ResponseMessage.Content().ReadAs(RString);
        JToken.ReadFrom(RString);
        JToken.SelectToken('[' + '''' + 'Time Series (Daily)' + '''' + ']', TimeSeries);
        JsonObject := TimeSeries.AsObject();
        ListOfDates := JsonObject.Keys();
        LatestDateAlreadyInDatabase := GetLatestDateAlreadyInDB(Symbol);
        foreach DateText in ListOfDates do
            IF GetDateFromText(DateText) >= LatestDateAlreadyInDatabase then begin //the price from the lastest date is changing during the day!
                JsonObject.SelectToken(DateText, JTokenRates);
                JsonObjectRates := JTokenRates.AsObject();
                ClosingPrice := GetJsonToken(JsonObjectRates, '' + '4. close' + '').AsValue().AsDecimal();
                DateOfRate := GetDateFromText(DateText);
                InsertStockPrice(Symbol, DateOfRate, ClosingPrice);
            end;
    end;

    local procedure GetJsonToken(JsonObject: JsonObject; TokenKey: text) JsonToken: JsonToken
    begin
        if not JsonObject.Get(TokenKey, JsonToken) then
            Error('Could not find token with key: %1', TokenKey);
    end;

    local procedure GetLatestDateAlreadyInDB(StockSymbol: Code[10]): Date
    var
        StockPrice: Record API_test_table2; //datensatzvariable
    begin
        StockPrice.SetRange(Symbol, StockSymbol);
        IF StockPrice.FindLast() THEN
            EXIT(StockPrice.Date)
        ELSE
            EXIT(0D);
    end;

    local procedure InsertStockPrice(StockSymbol: Code[10]; Date1: Date; ClosingPrice: Decimal)
    var
        StockPrice: Record API_test_table2; //datensatzvariable
    begin
        If StockPrice.Get(StockSymbol, Date1) and (StockPrice.ClosingPrice = ClosingPrice) then
            Exit;
        If StockPrice.Symbol = StockSymbol THEN begin
            StockPrice.ClosingPrice := ClosingPrice;
            StockPrice.Modify();
        end else begin
            StockPrice.Init();
            StockPrice.Symbol := StockSymbol;
            StockPrice.Date := Date1;
            StockPrice.ClosingPrice := ClosingPrice;
            StockPrice.Insert();
        end;
    end;

    local procedure GetDateFromText(DateText: Text): Date
    var
        Year: Integer;
        Month: Integer;
        Day: Integer;
    begin
        EVALUATE(Year, COPYSTR(DateText, 1, 4));
        EVALUATE(Month, COPYSTR(DateText, 6, 2));
        EVALUATE(Day, COPYSTR(DateText, 9, 2));
        EXIT(DMY2DATE(Day, Month, Year));
    end;
}