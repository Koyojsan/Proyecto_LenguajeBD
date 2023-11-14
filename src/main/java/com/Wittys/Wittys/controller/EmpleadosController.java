/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Wittys.Wittys.controller;

import com.Wittys.Wittys.domain.Empleados;
import com.Wittys.Wittys.domain.Factura;
import com.Wittys.Wittys.services.EmpleadosService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author USER
 */
@Controller
@Slf4j
@RequestMapping("/Empleados")
public class EmpleadosController {
    @Autowired
    private EmpleadosService empleadosService;
    
    @GetMapping("/Empleados")
    public String inicio(Model model){
        //var Mascotas = MascotasService(true);
        model.addAttribute("categorias", Empleados);
        model.addAttribute("totalCategorias",Empleados.size());
        return "/Empleados/listado";
    }
    @GetMapping("/nuevo")
    public String FacturaNuevo(Empleados empleados) {
        return "/Empleados/modifica";
    }
    
    @GetMapping("/eliminar/{IdEmpleados}")
    public String categoriaEliminar(Empleados empleados) {
        empleadosService.delete(empleados);
        return "redirect:/Factura/listado";
    }
    
    @GetMapping("/modificar/{IdEmpleados}")
    public String categoriaModificar(Empleados empleados, Model model) {
        empleados = (Empleados) empleadosService;
        model.addAttribute("mascota", empleados);
        return "/Factura/modifica";
    }
}
