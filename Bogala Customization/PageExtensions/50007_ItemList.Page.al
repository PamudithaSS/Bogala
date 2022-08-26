pageextension 50007 ItemList extends "Item List"
{
    layout
    {
        addafter("No.")
        {
            field("No. 2"; Rec."No. 2")
            {
                ApplicationArea = All;
            }
        }

        addafter("Assembly Policy")
        {
            field("Reorder Quantity"; Rec."Reorder Quantity")
            {
                ApplicationArea = All;
            }
            field("Reorder Point"; Rec."Reorder Point")
            {
                ApplicationArea = All;
            }
        }
        modify("Shelf No.")
        {
            Visible = true;
        }
    }
}