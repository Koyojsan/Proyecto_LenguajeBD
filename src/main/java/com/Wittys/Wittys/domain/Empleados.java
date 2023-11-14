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
@Table(name="Empleados")
public class Empleados implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Empleados")
    private Long IdEmpleado;
    private String NombreEmpleado;
    private String ApellidoEmpleado;
    private int Edad;
    private String Puesto;
    private boolean activo;

    public Empleados() {
    }

    public Empleados(String categoria, boolean activo) {
        this.NombreEmpleado = getNombreEmpleado();
        this.activo = activo;
    }
}
