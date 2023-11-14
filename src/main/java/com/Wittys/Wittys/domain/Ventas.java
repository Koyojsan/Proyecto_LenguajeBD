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
@Table(name="Ventas")
public class Ventas implements Serializable{
   @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Ventas")
    private Long IdVenta;
    private int FechaVenta;
    private String IdCliente;
    private String IdEmpleado;
    private String Direccion;
    private boolean activo;

    public Ventas() {
    }

    public Ventas(String categoria, boolean activo) {
        this.FechaVenta = getFechaVenta();
        this.activo = activo;
    }
}
