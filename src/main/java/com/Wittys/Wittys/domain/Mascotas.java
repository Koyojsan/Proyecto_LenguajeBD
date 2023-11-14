
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
@Table(name="Mascotas")
public class Mascotas implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Mascotas")
    private Long IdMascota;
    private Long IdCliente;
    private String NombreMascota;
    private String Tratamiento;
    private boolean activo;

    public Mascotas() {
    }

    public Mascotas(String categoria, boolean activo) {
        this.IdMascota = getIdMascota();
        this.NombreMascota = getNombreMascota();
        this.activo = activo;
    }
}
