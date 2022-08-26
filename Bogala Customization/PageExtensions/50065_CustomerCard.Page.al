pageextension 50065 CustomerCard extends "Customer Card"
{
    layout
    {
        modify("Tax Liable")
        {
            ApplicationArea = All;
        }
        modify("Tax Area Code")
        {
            ApplicationArea = All;
        }
    }
}