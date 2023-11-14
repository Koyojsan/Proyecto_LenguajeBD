
package com.Wittys.Wittys.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.io.Serializable;
import lombok.Data;

@Data
@Entity
@Table(name="Factura")
public class Factura implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Factura")
    private Long IdFactura;
    private Long IdVenta;
    private Long IdProducto;
    private String MetodoPago;
    private float PagoTotal;
    private boolean activo;

    public Factura() {
    }

    public Factura(String categoria, boolean activo) {
        this.IdFactura = getIdFactura();
        this.activo = activo;
    }
}
