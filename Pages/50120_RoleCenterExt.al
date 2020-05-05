pageextension 50120 RoleCenterExt extends "Order Processor Role Center" // https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-adding-menus-to-navigation-pane
{ //fügt einen neuen eintrag als Link in das Rollencenter hinzu...

    actions
    {
        addlast(Sections)
        {
            group("My Own Lists/Pages") //name der haupt navigation
            {
                action("My Own Page")//name der untergrupppe
                {
                    RunObject = page "My Own Page";
                    ApplicationArea = All;
                }
                action("My Own List")
                {
                    RunObject = page "My Own List"; // auch wenn Liste, es heisst trotzdem Dateityp Page
                    ApplicationArea = All;
                }

                // Creates a sub-menu
                group("API Test")
                {
                    action("API_test Page Card")
                    {
                        ApplicationArea = All;
                        RunObject = page "API_test Page Card";
                    }
                    action("API_test Page")
                    {
                        ApplicationArea = All;
                        RunObject = page "API_test Page";
                    }
                    action("API_test List")
                    {
                        ApplicationArea = All;
                        RunObject = page API_testList;
                    }
                }
            }
        }
    }
}