pageextension 50048 PurchaseReturnOrder extends "Purchase Return Order"
{
    layout
    {
        addafter("Tax Area Code")
        {
            // field("Tax Area Code"; Rec."Tax Area Code")
            // {
            //     ApplicationArea = All;
            // }
            field("Tax Group"; Rec."Tax Group")
            {
                ApplicationArea = All;
            }
            // field("Tax Liable"; Rec."Tax Liable")
            // {
            //     ApplicationArea = All;
            // }
        }
    }
}