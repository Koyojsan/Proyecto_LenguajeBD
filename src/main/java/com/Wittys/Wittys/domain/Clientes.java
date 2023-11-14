
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
@Table (name="Clientes")

public class Clientes implements Serializable{
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Clientes")
    private Long IdCliente;
    private String NombreCliente;
    private String ApellidoCliente;
    private String CorreoCliente;
    private int TelefonoCliente;
    private boolean activo;

    public Clientes() {
    }

    public Clientes(String categoria, boolean activo) {
        this.CorreoCliente = getCorreoCliente();
        this.activo = activo;
    }
}
