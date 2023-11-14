/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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
@Table(name="Proveedores")
public class Proveedores implements Serializable{
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Proveedores")
    private Long IdProveedor;
    private int IdProducto;
    private String NombreProveedor;
    private String NombreProducto;
    private boolean activo;

    public Proveedores() {
    }

    public Proveedores(String categoria, boolean activo) {
        this.NombreProveedor = getNombreProveedor();
        this.activo = activo;
    }
}
