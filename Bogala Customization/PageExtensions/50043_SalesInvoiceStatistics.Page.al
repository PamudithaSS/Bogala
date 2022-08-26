pageextension 50043 SalesInvoiceStatistics extends "Sales Invoice Statistics"
{
    layout
    {
        addafter(AdjustedCostLCY)
        {
            field("Currency Code"; Rec."Currency Code")
            {
                ApplicationArea = All;
            }
        }
    }
}