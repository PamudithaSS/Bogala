pageextension 50071 "Purch. Quote Subform" extends "Purchase Quote Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Line Amount")
        {
            field("Tax Area Code 1"; Rec."Tax Area Code")
            {
                ApplicationArea = All;
                Caption = 'Tax Area Code';
            }
            field("Tax Group Code 1"; Rec."Tax Group Code")
            {
                ApplicationArea = All;
                Caption = 'Tax Group Code';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}