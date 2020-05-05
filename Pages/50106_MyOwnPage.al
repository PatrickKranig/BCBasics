page 50106 "My Own Page"
{
    PageType = Card; // The page will be of type "Card" and will render as a card.    
    UsageCategory = Tasks;// The page will be part of the "Tasks" group of search results. - https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-al-menusuite-functionality   
    SourceTable = MyOwnTable; //name der tabelle - The source table shows data from the Own table.

    // The target Help topic is hosted on the website that is specified in the app.json file.
    ContextSensitiveHelpPage = ' creating Custom Page'; //das hier stellt quasi einen substring bereit, der hinter die standard Hilfe seite in der app-json angehangen wird (praktisch für URL Concat in Dokus)

    // The layout describes the visual parts on the page.
    layout
    {
        area(content)
        {
            group(Reward)
            {
                field("Reward Id"; "Feld1_table_ID") //Feld auf Basis der Owntabelle
                {
                    // ApplicationArea sets the application area that 
                    // applies to the page field and action controls. 
                    // Setting the property to All means that the control 
                    // will always appear in the user interface.
                    ApplicationArea = All;
                    ToolTip = 'die spezifische Quickinfo ... stellt hier die ID dar (PK)';
                }

                field(Description; Feld2_table) //Feld auf Basis der Owntabelle - // "" ist mit unterstrichnamen redundant
                {
                    ApplicationArea = All;
                    ToolTip = 'die spezifische Quickinfo ... stellt hier das 2. feld der hidden tabelle dar';
                }

                field("Discount Percentage"; Feld3_table)//Feld auf Basis der Owntabelle - // "" ist mit unterstrichnamen redundant
                {
                    ApplicationArea = All;
                    ToolTip = 'die spezifische Quickinfo ... stellt hier das 3. feld der hidden tabelle dar';
                }
            }
        }
    }
}