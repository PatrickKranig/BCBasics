page 50102 "My Own List"
{
    PageType = List; // Specify that this page will be a list page.    
    UsageCategory = Lists; // The page will be part of the "Lists" group of search results. - https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-al-menusuite-functionality    
    SourceTable = MyOwnTable; // die referenz auf die tabelle - The data of this page is taken from the Own table.

    ContextSensitiveHelpPage = ' creating Custom List'; //das hier stellt quasi einen substring bereit, der hinter die standard Hilfe seite in der app-json angehangen wird (praktisch für URL Concat in Dokus)

    // The "CardPageId" is set to the Reward Card previously created.    
    CardPageId = "My Own Page";// This will allow users to open records from the list in Ownpage.
    // quasi der FK auf grundlage des PK
    layout
    {
        area(content)
        {
            repeater(Rewards)
            {
                field("Reward ID"; "Feld1_table_ID") //Feld auf Basis der Owntabelle
                {
                    ApplicationArea = All;
                    ToolTip = 'die spezifische Quickinfo ... stellt hier die ID dar (PK)';
                }

                field(Description; Feld2_table) //Feld auf Basis der Owntabelle - // "" ist mit unterstrichnamen redundant
                {
                    ApplicationArea = All;
                    ToolTip = 'die spezifische Quickinfo ... stellt hier das 2. feld der hidden tabelle dar';

                }

                field("Discount Percentage"; Feld3_table) //Feld auf Basis der Owntabelle - // "" ist mit unterstrichnamen redundant
                {
                    ApplicationArea = All;
                    ToolTip = 'die spezifische Quickinfo ... stellt hier das 3. feld der hidden tabelle dar';
                }
            }
        }
    }
}