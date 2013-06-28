Imports Servicios

Public Class ViewCart
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindData()
        End If
    End Sub

    Private Sub BindData()
        gvShoppingCart.DataSource = ShoppingCart.Instance.Items
        gvShoppingCart.DataBind()
    End Sub

    Protected Sub gvShoppingCart_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(3).Text = "Total: " & String.Format("{0:$ 0.00}", ShoppingCart.Instance.GetSubTotal())
        End If
    End Sub

    Protected Sub gvShoppingCart_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)
        If e.CommandName = "Remove" Then
            Dim productId = Convert.ToInt32(e.CommandArgument)
            ShoppingCart.Instance.QuitarItem(productId)
        End If
        BindData()
    End Sub

    Protected Sub btnUpdateCart_Click(ByVal sender As Object, ByVal e As EventArgs)
        For Each row As GridViewRow In gvShoppingCart.Rows
            If row.RowType = DataControlRowType.DataRow Then
                Try
                    Dim productId = Convert.ToInt32(gvShoppingCart.DataKeys(row.RowIndex).Value)
                    Dim cantidad = Integer.Parse(CType(row.Cells(1).FindControl("txtCantidad"), TextBox).Text)
                    ShoppingCart.Instance.SetItemCantidad(productId, cantidad)
                Catch ex As Exception
                    My.Application.HandlerException(Me, ex)
                End Try
            End If
        Next

        BindData()
    End Sub

End Class
