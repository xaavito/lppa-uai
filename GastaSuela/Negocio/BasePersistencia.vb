Public MustInherit Class BasePersistencia

    Private _oid As Integer = 0
    Private _estadoPersistencia As EstadoPersistencia

    Public Property Persistencia() As EstadoPersistencia
        Get
            Return _estadoPersistencia
        End Get
        Set(ByVal value As EstadoPersistencia)
            _estadoPersistencia = value
        End Set
    End Property


    Public Property OID() As Integer
        Get
            Return _oid
        End Get
        Set(ByVal value As Integer)
            _oid = value
        End Set
    End Property

    Public Overloads Overrides Function Equals(obj As Object) As Boolean
        If obj Is Nothing Or IsDBNull(obj) Then
            Return False
        End If

        If Not Me.GetType() Is obj.GetType() Then
            If Not Me.GetType().IsAssignableFrom(obj.GetType()) Then
                Return False
            End If
        End If

        Dim b As BasePersistencia = CType(obj, BasePersistencia)
        Return b.OID = Me.OID
    End Function

End Class
