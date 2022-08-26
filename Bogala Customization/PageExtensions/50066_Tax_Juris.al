pageextension 50066 TaxJuPage extends "Tax Jurisdictions"
{
    layout
    {
        modify(Description)
        {
            ApplicationArea = All;
            Visible = true;
        }
        modify("Default Sales and Use Tax")
        {
            ApplicationArea = All;
            Visible = true;
        }
        modify("Tax Account (Sales)")
        {
            ApplicationArea = All;
            Visible = true;
        }
        modify("Tax Account (Purchases)")
        {
            ApplicationArea = All;
            Visible = true;
        }

    }

    actions
    {
        modify(Details)
        {
            Visible = true;
            ApplicationArea = All;
        }
    }

}
pageextension 50067 TaxDetails extends "Tax Details"
{
    layout
    {
        modify("Tax Jurisdiction Code")
        {
            ApplicationArea = All;
            Visible = true;
        }
        modify("Tax Group Code")
        {
            ApplicationArea = All;
            Visible = true;
        }
        modify("Tax Type")
        {
            ApplicationArea = All;
            Visible = true;
        }
        modify("Effective Date")
        {
            ApplicationArea = All;
            Visible = true;
        }
        modify("Tax Below Maximum")
        {
            ApplicationArea = All;
            Visible = true;
        }
        modify("Maximum Amount/Qty.")
        {
            ApplicationArea = All;
            Visible = true;
        }
        modify("Tax Above Maximum")
        {
            ApplicationArea = All;
            Visible = true;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

}