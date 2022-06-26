<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section id="subscribe">
    <div class="grid wide">
        <div class="row subscribe-wrapper">
            <div class="col l-7">
                <div class="subscribe-content">
                    <h5>JOIN OUR NEWSLETTER</h5>
                    <h2>Subscribe to get Updated with new offers</h2>
                    <form action="subscribe" method="post" class="subscribe-form">
                        <input type="email" name="email" placeholder="${message.getMessage()}"
                               class="subscribe-control col l-8 ${message.getType()}" style="height: 60px"
                               required
                        />
                        <button type="submit" class="subscribe-submit">
                            Subscribe now
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>