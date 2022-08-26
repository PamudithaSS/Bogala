pageextension 50063 SalesOrderList extends "Sales Order List"
{
    layout
    {
        addafter("Job Queue Status")
        {
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = All;
            }
        }
    }
}