pageextension 50064 PurchaseOrderList extends "Purchase Order List"
{
    layout
    {
        addafter("Posting Date")
        {
            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("Job Queue Status")
        {
            field("Created User"; Rec."Created User")
            {
                ApplicationArea = All;
            }
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = All;
            }
        }
    }

}