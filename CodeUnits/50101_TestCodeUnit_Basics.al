codeunit 50101 TestCodeUnit_Basics // https://www.archerpoint.com/blog/Posts/using-codeunits-microsoft-dynamics-365-business-central
{ //eingerückten code nach einen Kommentar kann man ähnlich dem region in C# oder allgemein wie im OnNote auf und zuklappen

    //Verwenden Sie Strg+Leertaste, um IntelliSense an jeder Stelle im Code zu aktivieren, was Ihnen hilft, mögliche Optionen zu identifizieren.

    /* Eine Variable kann mit einem globalen oder einem lokalen Bereich definiert werden. Wenn Sie Ihre Variable mit einem globalen Bereich definieren, ist sie überall im Objekt verfügbar. Bei jedem Trigger, überall, wo Sie Codeanweisungen schreiben möchten, ist diese Variable verfügbar.

    Wenn der Bereich lokal ist, können Sie nur auf diese Variable in dem bestimmten Trigger zugreifen, an dem sie deklariert wurde. Im folgenden Beispiel werden globale Variablen nur für zusätzliche Details verwendet. Es verwendet drei Variablen, aber die mytext-Variable ist genug für diese Nachrichtenanweisung. */
    var //variablen deklarieren
        myDateTag: Integer; //deklariert eine leere globale variable vom Typ Int- ZUWEISUNG HIER NET MÖGLICH!
        myDateMonat: Integer; //deklariert eine leere globale variable vom Typ Int- ZUWEISUNG HIER NET MÖGLICH!
        myDateJahr: Integer; //deklariert eine leere globale variable vom Typ Int- ZUWEISUNG HIER NET MÖGLICH!

    trigger OnRun() //ist quasi der konstruktur und läuft bei aufruf los...
    begin
        //https://docs.microsoft.com/en-us/dynamics-nav/message-function--dialog-
        myDateTag := Date2DMY(Today, 1); //zuweisung zu zuvor erstellter variable
        myDateMonat := Date2DMY(Today, 2); //zuweisung zu zuvor erstellter variable
        myDateJahr := Date2DMY(Today, 3); //zuweisung zu zuvor erstellter variable
        Message('hi ich bin die codeunit!\\Heute ist: %1.%2.%3', myDateTag, myDateMonat, myDateJahr);
    end;

    procedure MyMethode();
    begin
        Message('...und ich bin die methode der getriggerten codeunit...');
    end;

    procedure Rechne(number1: Integer; number2: Integer)
    var // https://www.archerpoint.com/blog/Posts/using-codeunits-microsoft-dynamics-365-business-central
        total: Integer;
    begin
        //berechnung
        total := number1 + number2; //berechnung
        Message('summe der Parameter %1 & %2 is %3', number1, number2, total);
    end;

    //arbeite dich ma mit ein!
    //schleife, if then else, error
}