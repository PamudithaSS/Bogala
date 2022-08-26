pageextension 50009 GeneralJournal extends "General Journal"
{
    layout
    {
        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
            }
        }
        modify("Incoming Document Entry No.")
        {
            Visible = false;
        }
        modify("Currency Code")
        {
            Visible = true;
        }
    }
}