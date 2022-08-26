pageextension 50045 DimensionSetEntries extends "Dimension Set Entries"
{
    layout
    {
        addafter("Dimension Value Name")
        {
            field("Dimension Set ID"; Rec."Dimension Set ID")
            {
                ApplicationArea = All;
            }
        }
    }
}