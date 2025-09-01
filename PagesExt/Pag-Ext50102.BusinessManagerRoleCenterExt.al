pageextension 50102 "ACT Business Manager RC Ext" extends "Business Manager Role Center"
{
    actions
    {
        addlast(embedding)
        {
            action("ACT Requests")
            {
                ApplicationArea = All;
                Caption = 'ACT Requests';
                RunObject = Page "ACT Request List";
                ToolTip = 'View and manage material requests (Purchase or Transfer).';
                Image = Document;
            }
        }
    }
}