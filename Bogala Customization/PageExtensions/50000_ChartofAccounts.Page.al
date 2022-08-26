pageextension 50000 ChartofAccounts extends "Chart of Accounts"
{
    layout
    {
        addafter(Name)
        {
            field("Search Name"; Rec."Search Name")
            {
                ApplicationArea = All;
            }
            field("Date Filter"; Rec."Date Filter")
            {
                ApplicationArea = All;
            }
        }
        modify("Gen. Posting Type")
        {
            Visible = false;
        }
        modify("Gen. Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Gen. Prod. Posting Group")
        {
            Visible = false;
        }
        modify("Cost Type No.")
        {
            Visible = false;
        }
    }
}
