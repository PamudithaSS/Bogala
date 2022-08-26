pageextension 50044 GLBalanceBudget extends "G/L Balance/Budget"
{
    layout
    {
        addafter(BudgetPct)
        {
            field("Debit Deference"; Rec."Budgeted Debit Amount" - Rec."Debit Amount")
            {
                ApplicationArea = All;
            }
            field("Credit Deference"; Rec."Budgeted Credit Amount" - Rec."Credit Amount")
            {
                ApplicationArea = All;
            }
        }
    }
}