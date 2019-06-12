const PRODUCTS_DATA = {};
let basket = null;

fetch('/clothes_shop/templates/get_all_products_data.php')
    .then((resp) => resp.json())
    .then((data) => {
        data.forEach((item) => {
            PRODUCTS_DATA[item.id] = item;
        });
        basket = new Basket();
    })
    .catch((err) => {
        throw new Error(err);
    });

class Basket {
    constructor() {
        this.items = {};
        this.basket = $('.basket');
        this.basketBodyElem = $('.basket-body');
        this.basketProductsElem = $('.basket-products');
        this.basketTotalPriceElem = $('.basket-total-price');

        const storedItems = this.getItemsFromLocalStorage();
        if (storedItems) {
            this.items = storedItems;
            this.updateBasketView(storedItems);
        }
    }

    updateBasketView(storedItems) {
        Object.keys(storedItems).forEach((itemId) => {
            let counter = storedItems[itemId];
            while (counter > 0) {
                if (counter === this.items[itemId]) {
                    this.addItem(itemId, false, false);
                } else {
                    this.addItem(itemId, false, true);
                }
                counter--;
            }
            this.updateViewAvailablePieces(itemId, storedItems[itemId]);
        });
    }

    updateViewAvailablePieces(itemId, pieces) {
        const availablePiecesElem = $('[data-available-pieces=' + itemId + ']');
        const availablePieces = parseInt(availablePiecesElem.text());
        availablePiecesElem.text(availablePieces - pieces);
    }

    addItem(itemId, updateBasketItems, updateItem) {
        if (this.items[itemId] && updateItem) {
            if (updateBasketItems) {
                this.items[itemId]++;
            }
            this.updateItemHtmlElem(itemId);
        } else {
            if (updateBasketItems) {
                this.items[itemId] = 1;
            }
            this.addItemHtmlElem(itemId);
        }
        if (updateBasketItems) {
            this.setItemsToLocalStorage();
        }
        this.basketBodyElem.show();
        this.updateTotalPrice();
    }

    updateTotalPrice() {
        this.basketTotalPriceElem.text(this.calculateTotalPrice());
    }

    calculateTotalPrice() {
        let totalPrice = 0;
        Object.keys(this.items).forEach((item) => {
            let counter = this.items[item];
            while (counter > 0) {
                totalPrice += parseInt(PRODUCTS_DATA[item].price);
                counter--;
            }
        });
        return totalPrice;
    }

    updateItemHtmlElem(itemId) {
        const basketAmountElem = this.basket.find('[data-basket-item=' + itemId + ']').find('.basket-item-amonut');
        basketAmountElem.text(this.items[itemId]);
    }

    watchForRemoveItem(itemId) {
        this.basketBodyElem.find('[data-basket-item=' + itemId + ']').find('.basket-remove-item').click(() => {
            this.removeItem(itemId);
        });
    }

    removeItem(itemId) {
        const basketAmountElem = $(this.basketBodyElem.find('[data-basket-item=' + itemId + ']').find('.basket-item-amonut'));
        const basketAmount = parseInt(basketAmountElem.text());
        if (basketAmount-1 > 0) {
            basketAmountElem.text(basketAmount - 1);
            this.items[itemId]--;
        } else {
            basketAmountElem.parents('li').remove();
            delete this.items[itemId];
        }

        if (this.getNumberOfDifferentItems() === 0) {
            this.basketBodyElem.hide();
        }

        this.updateTotalPrice();
        this.updateProductAmountOnView(itemId, basketAmount-1);
        this.setItemsToLocalStorage();
    }

    updateProductAmountOnView(productId,) {
        const availablePiecesElem = $('[data-available-pieces=' + productId + ']');
        availablePiecesElem.text(parseInt(availablePiecesElem.text()) + 1);
    }

    addItemHtmlElem(itemId) {
        this.basketProductsElem.append(this.createItemElem(itemId));
        this.watchForRemoveItem(itemId);
    }

    createItemElem(itemId) {
        const itemElem = $(document.createElement('li'));
        return itemElem.html('<div data-basket-item=' + itemId + ' class="basket-item"><p></p>' 
            + PRODUCTS_DATA[itemId].name + '</p><p>Sztuk: <span class="basket-item-amonut">' 
            + this.items[itemId] + '</span><span title="Usuń sztukę produktu z koszyka" class="basket-remove-item">&times;</span></p></div><hr>');
    }

    getNumberOfDifferentItems() {
        return Object.keys(this.items).length;
    }

    setItemsToLocalStorage() {
        localStorage.setItem('items', JSON.stringify(basket.items));
    }
    
    getItemsFromLocalStorage() {
        return JSON.parse(localStorage.getItem('items'));
    }
}

$('[data-buy-button]').click((event) => {
    const productId = $(event.target).attr('data-buy-button');
    const availablePiecesElem = $('[data-available-pieces=' + productId +']');
    let availablePieces = parseInt(availablePiecesElem.text());
    if (availablePieces > 0) {
        basket.addItem(productId, true, true);
        availablePiecesElem.text(availablePieces - 1);
    } else {
        errorShake(availablePiecesElem);
    }
});

function errorShake(elem) {
    const cardElem = elem.parents('.card-body');
    const elemParent = elem.parents('.product-availability');

    cardElem.addClass('ahashakeheartache');
    elemParent.addClass('error');

    cardElem.on('webkitAnimationEnd oanimationend msAnimationEnd animationend', (e) => {
        cardElem.delay(200).removeClass('ahashakeheartache');
        elemParent.removeClass('error');
    });
}
