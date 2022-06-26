package vn.furniture.controller.admin.product;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import vn.furniture.DAO.*;
import vn.furniture.entity.*;
import vn.furniture.service.XMessage;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;

import java.io.PrintWriter;
import java.net.http.HttpClient;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

@MultipartConfig
@WebServlet(name = "AddController", value = "/add-product")
public class AddController extends HttpServlet {
    private ProductDAO productDAO;
    private CategoryDAO categoryDAO;
    private ProductDetailDAO productDetailDAO;
    private MaterialDAO materialDAO;
    private OriginDAO originDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        productDAO = new ProductDAO();
        categoryDAO = new CategoryDAO();
        productDetailDAO = new ProductDetailDAO();
        materialDAO = new MaterialDAO();
        originDAO = new OriginDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("view/manage/add.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("name");
        int quantityStock = Integer.parseInt(request.getParameter("quantity-stock"));
        int quantityImport = Integer.parseInt(request.getParameter("quantity-import"));
        double price = Double.parseDouble(request.getParameter("price"));
        double salePrice = Double.parseDouble(request.getParameter("sale-price"));
        String category = request.getParameter("category");
        String width = request.getParameter("width");
        String height = request.getParameter("height");
        String depth = request.getParameter("depth");
        String weight = request.getParameter("weight");
        String des = request.getParameter("description");
        String material = request.getParameter("material");
        String origin = request.getParameter("origin");

        Part avatar = request.getPart("avatar");
        String path = getServletContext().getRealPath("data/products");
        String fileName = System.currentTimeMillis() + "-" + avatar.getSubmittedFileName();
        if (!Files.exists(Path.of(path))) Files.createDirectories(Path.of(path));
        avatar.write(path + File.separator + fileName);

        String categoryId = categoryDAO.getId(category);
        Category ctgr;
        Product product;

        if (categoryId != null)
            product = new Product(productName, "data/products/"  + fileName, price, salePrice, quantityStock, quantityImport
                    , categoryId);
        else{
            ctgr = new Category(category);
            categoryDAO.add(ctgr);
            product = new Product(productName, "data/products/"  + fileName, price, salePrice, quantityStock, quantityImport
                    , ctgr.getCategoryId());
        }
        Material mtrl;
        ProductDetail productDetail;
        String materialId = materialDAO.getId(material);
        String originId = originDAO.getId(origin);
        Origin org;

        if (materialId == null){
            mtrl = new Material(material);
            materialDAO.add(mtrl);
            materialId = mtrl.getMaterialId();
        }
        if (originId == null){
            org = new Origin(origin);
            originDAO.add(org);
            originId = org.getOriginId();
        }

        productDetail = new ProductDetail(product.getProductId(),
                    width, height, depth, weight, des, originId, materialId);

        XMessage message = productDAO.add(product) > 0 && productDetailDAO.add(productDetail) > 0
                ? new XMessage("success", "Saved")
                :new XMessage("danger", "Failed");
        request.setAttribute("message", message);
        request.getRequestDispatcher("view/manage/add.jsp").forward(request, response);
    }
}



