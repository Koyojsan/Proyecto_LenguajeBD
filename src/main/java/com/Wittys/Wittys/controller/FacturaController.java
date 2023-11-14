/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Wittys.Wittys.controller;

import com.Wittys.Wittys.domain.Factura;
import com.Wittys.Wittys.services.FacturaService;
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
@RequestMapping("/Factura")
public class FacturaController {
     @Autowired
    private FacturaService facturaService;
    
    @GetMapping("/Factura")
    public String inicio(Model model){
        //var Mascotas = MascotasService(true);
        model.addAttribute("categorias", Factura);
        model.addAttribute("totalCategorias",Factura.size());
        return "/Factura/listado";
    }
    @GetMapping("/nuevo")
    public String FacturaNuevo(Factura factura) {
        return "/Mascota/modifica";
    }
    
    @GetMapping("/eliminar/{IdFactura}")
    public String categoriaEliminar(Factura factura) {
        facturaService.delete(factura);
        return "redirect:/Factura/listado";
    }
    
    @GetMapping("/modificar/{IdFactura}")
    public String categoriaModificar(Factura factura, Model model) {
        factura = (Factura) facturaService;
        model.addAttribute("mascota", factura);
        return "/Factura/modifica";
    }
}
