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
@Table(name="Productos")
public class Productos implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Productos")
    private Long IdProducto;
    private String NombreProducto;
    private String DescripcionProducto;
    private int Cantidad;
    private int Precio;
    private boolean activo;

    public Productos() {
    }

    public Productos(String categoria, boolean activo) {
        this.NombreProducto = getNombreProducto();
        this.Cantidad = getCantidad();
        this.Precio = getPrecio();
        this.activo = activo;
    }
}
