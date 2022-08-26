query 50008 "Item Sales price"
{
    elements
    {
        dataitem(SalesPrice; "Sales Price")
        {
            column(SalesType; "Sales Type")
            { }
            column(SalesCode; "Sales Code")
            { }
            column(ItemNo; "Item No.")
            { }
            column(UoMCode; "Unit of Measure Code")
            { }
            column(UnitPrice; "Unit Price")
            { }
        }
    }
}

