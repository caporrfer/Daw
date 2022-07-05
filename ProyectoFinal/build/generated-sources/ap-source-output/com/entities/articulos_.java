package com.entities;

import com.entities.comentarios;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-01-27T13:32:45")
@StaticMetamodel(articulos.class)
public class articulos_ { 

    public static volatile SingularAttribute<articulos, String> descripcion;
    public static volatile SingularAttribute<articulos, String> nombrePropietario;
    public static volatile SingularAttribute<articulos, String> estado;
    public static volatile SingularAttribute<articulos, Integer> precio;
    public static volatile SingularAttribute<articulos, String> categoria;
    public static volatile SingularAttribute<articulos, Long> idUsuario;
    public static volatile ListAttribute<articulos, comentarios> lc;
    public static volatile SingularAttribute<articulos, Long> id;
    public static volatile SingularAttribute<articulos, String> nombre;
    public static volatile SingularAttribute<articulos, Integer> anio;

}