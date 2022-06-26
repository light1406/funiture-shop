package vn.furniture.controller.admin.product;

import org.apache.commons.fileupload.FileItem;
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
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name = "UpdateController", value = "/update-product")
public class UpdateController extends HttpServlet {
    private ServletFileUpload upload = null;

    @Override
    public void init() throws ServletException {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        File dir = (File) getServletContext().getAttribute("DIR_PATH");
        factory.setRepository(dir);
        this.upload = new ServletFileUpload(factory);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("pid");
        HttpSession session = request.getSession();
        session.setAttribute("pid", id);
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getRow(id);
        if (product == null) {
            response.setStatus(404);
        } else {
            ProductDetailDAO productDetailDAO = new ProductDetailDAO();
            MaterialDAO materialDAO = new MaterialDAO();
            CategoryDAO categoryDAO = new CategoryDAO();
            OriginDAO originDAO = new OriginDAO();

            ProductDetail productDetail = productDetailDAO.getRow(product.getProductId());
            List<Category> categories = categoryDAO.getList();
            List<Material> materials = materialDAO.getList();
            List<Origin> origins = originDAO.getList();

            request.setAttribute("categories", categories);
            request.setAttribute("materials", materials);
            request.setAttribute("origins", origins);
            request.setAttribute("productDetail", productDetail);
            request.setAttribute("product", product);
        }

        request.getRequestDispatcher("view/manage/update.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("pid");
        session.removeAttribute("pid");

        if (!ServletFileUpload.isMultipartContent(request)) {
            throw new ServletException("Content type is not multipart/form-data");
        } else {
            ImageDAO imageDAO = new ImageDAO();
            HashMap<String, String> fields = new HashMap<>();
            ProductDAO productDAO = new ProductDAO();
            ProductDetailDAO productDetailDAO = new ProductDetailDAO();

            List<Image> images = imageDAO.getList(id);
            Product product = productDAO.getRow(id);
            if (product != null) {
                File file = new File(request.getServletContext().getAttribute("STRING_PATH") + File.separator + product.getLinkImage());
                System.out.println(file.getAbsolutePath());
                if (!file.delete()) {
                    System.out.println("Not path");
                }
            }
            for (Image image : images) {
                File file = new File(request.getServletContext().getAttribute("STRING_PATH") + File.separator + image.getImage());
                System.out.println(file.getAbsolutePath());
                if (!file.delete()) {
                    System.out.println("Not path");
                }
                imageDAO.delete(image);
            }


            try {
                int index = 1;
                List<FileItem> items = upload.parseRequest(request);
                Iterator<FileItem> it = items.iterator();
                String[] imgExtension = {".jpg", ".png", ".jpeg"};
                while (it.hasNext()) {
                    FileItem item = it.next();

                    if (!item.isFormField()) {
                        String extension = item.getName().substring(item.getName().lastIndexOf("."));
                        if (Arrays.asList(imgExtension).contains(extension)) {
                            File file = new File(request.getServletContext().getAttribute("STRING_PATH") + File.separator + item.getName());
                            if (file.exists()) break;
                            fields.put(item.getFieldName() + index, item.getName());
                            item.write(file);
                            index++;
                        }
                    } else {
                        fields.put(item.getFieldName(), item.getString());
                    }
                }
                // xu ly add
                String name = fields.get("name");
                String quantityStock = fields.get("quantity-stock");
                String quantityImport = fields.get("quantity-import");
                String dateImport = fields.get("date-import");
                String width = fields.get("width");
                String height = fields.get("height");
                String depth = fields.get("depth");
                String weight = fields.get("weight");
                String description = fields.get("description");
                String price = fields.get("price");
                String salePrice = fields.get("sale-price");
                String category = fields.get("category");
                String material = fields.get("material");
                String origin = fields.get("origin");
                String status = fields.get("status");
                String file1 = fields.get("file1");
                String file2 = fields.get("file2");
                String file3 = fields.get("file3");
                String file4 = fields.get("file4");


                if (product != null) {
                    product.setProductId(product.getProductId());
                    product.setProductName(name);
                    product.setLinkImage(file1);
                    product.setPrice(Double.parseDouble(price));
                    product.setSalePrice(Double.parseDouble(salePrice));
                    product.setQuantityStock(Integer.parseInt(quantityStock));
                    product.setQuantityImport(Integer.parseInt(quantityImport));
                    product.setDateImport(new Timestamp(new SimpleDateFormat("yyyy-MM-dd").parse(dateImport).getTime()));
                    product.setStatus(Boolean.parseBoolean(status));
                    product.setCreateAt(product.getCreateAt());
                    product.setUpdateAt(new Timestamp(new Date().getTime()));
                    product.setCategoryId(category);

                    ProductDetail productDetail = new ProductDetail();
                    productDetail.setProductId(product.getProductId());
                    productDetail.setWidth(width);
                    productDetail.setHeight(height);
                    productDetail.setDepth(depth);
                    productDetail.setWeight(weight);
                    productDetail.setDescription(description);
                    productDetail.setOrigin(origin);
                    productDetail.setMaterial(material);

                    Image image2 = new Image(0, file2, id);
                    Image image3 = new Image(0, file3, id);
                    Image image4 = new Image(0, file4, id);
                    if (productDAO.update(product) == 1) {
                        productDetailDAO.update(productDetail);
                        imageDAO.add(image2);
                        imageDAO.add(image3);
                        imageDAO.add(image4);

                        XMessage message = new XMessage("success", "Update record success");
                        request.setAttribute("message", message);
                        request.getRequestDispatcher("show-product").forward(request, response);
                    }
                }
            } catch (FileUploadException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

    }


}
