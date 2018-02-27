<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="admin-product">
  <div class="product-header">
    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 product-header-left">
      <div class="product-name">
        ${product.getName()}
      </div>

      <div class="product-rate">
        <c:forEach begin="1" end="${product.getRating()}">
          <span class="rate"><i class="fa fa-star active"></i></span>
        </c:forEach>

        <c:forEach begin="${product.getRating() + 1}" end="5">
          <span class="rate"><i class="fa fa-star"></i></span>
        </c:forEach>
        <span>(${product.getRating()})</span>
      </div>
    </div>
    <div class="clearfix"></div>
  </div>
      
  <div class="product-body">
    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 product-body-left">
      <img src="${product.getAvatar()}" class="img-responsive" />
    </div>

    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 product-body-right">
      <div class="product-price">
        <fmt:setLocale value="en_US" />
        <fmt:formatNumber value="${product.getPrice()}" type="currency" />
      </div>

      <div class="product-category">
        <span class="category-title">Category: </span>
        <span class="category">${product.getCategory().getName()}</span>
      </div>

      <div class="product-number">
        <span class="number-title">Number: </span>
        <span class="number">${product.getNumber()}</span>
      </div>
      
      <c:if test="${product.getIsPromotion()}">
        <div class="product-promotion">
          <span class="promotion-title">Promotion:</span>
          <span class="promotion">${product.getSaleOf()}%</span>
        </div>
      </c:if>
      
      <div class="product-information">
        <span class="information">${product.getInformation()}</span>
      </div>
    </div>
    <div class="clearfix"></div>
  </div>

  <div class="product-footer">
    <div class="product-images">
      <hr>
      <div id="recommended-item-carousel" class="carousel slide"
        data-ride="carousel">
        <c:choose>
          <c:when test="${slideSize > 0}">
            <div class="carousel-inner">
              <c:forEach begin="0" end="${slideSize - 1}" varStatus="loop">
                <div class="item ${loop.index == 0 ? 'active' : ''}">
                  <c:forEach var="image" items="${product.getImages()}" begin="${loop.index * 3}"
                    end="${loop.index * 3 + 2}">
                    <div class="col-sm-4">
                      <img class="product-image" src="${image.getImage()}" alt="" />
                    </div>
                  </c:forEach>
                </div>
              </c:forEach>
            </div>

            <a class="left recommended-item-control"
              href="#recommended-item-carousel" data-slide="prev">
              <i class="fa fa-angle-left"></i>
            </a>
            <a class="right recommended-item-control"
              href="#recommended-item-carousel" data-slide="next">
              <i class="fa fa-angle-right"></i>
            </a>
          </c:when>

          <c:otherwise>
            <h3>No images</h3>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
  <div class="clearfix"></div>
</div>
