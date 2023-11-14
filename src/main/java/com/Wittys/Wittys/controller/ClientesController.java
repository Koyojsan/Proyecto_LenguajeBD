/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Wittys.Wittys.controller;

import com.Wittys.Wittys.domain.Clientes;
import com.Wittys.Wittys.domain.Factura;
import com.Wittys.Wittys.services.ClientesService;
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
@RequestMapping("/Clientes")
public class ClientesController {
    @Autowired
    private ClientesService clientesService;
    
    @GetMapping("/Clientes")
    public String inicio(Model model){
        //var Mascotas = MascotasService(true);
        model.addAttribute("categorias", Clientes);
        model.addAttribute("totalCategorias",Clientes.size());
        return "/Clientes/listado";
    }
    @GetMapping("/nuevo")
    public String FacturaNuevo(Clientes clientes) {
        return "/Clientes/modifica";
    }
    
    @GetMapping("/eliminar/{IdClientes}")
    public String categoriaEliminar(Factura factura) {
        clientesService.delete(factura);
        return "redirect:/Factura/listado";
    }
    
    @GetMapping("/modificar/{IdClientes}")
    public String categoriaModificar(Clientes clientes, Model model) {
        clientes = (Clientes) clientesService;
        model.addAttribute("Clientes", clientes);
        return "/Clientes/modifica";
    }
}
