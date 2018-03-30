public class ItemQuote {

  public long itemNumber;         // 商品番号
  public String itemDescription;  // 商品の説明
  public int quantity;            // 見積もりの商品の数 (必ず 1 以上)
	public int unitPrice;           // 商品の単価 (セント単位)
	public boolean discounted;      // 価格に値引きが反映されているかどうか
	public boolean inStock;         // 商品の在庫があるかどうか

	public ItemQuote (long itemNumber, String itemDescription,
			int quantity, int unitPrice, boolean discounted, boolean inStock) {
		this.itemNumber = itemNumber;
		this.itemDescription = itemDescription;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.discounted = discounted;
		this.inStock = inStock;
	}

	public String toString() {
	  final String EOLN = java.lang.System.getProperty("line.separator");
		String value = "Item#=" + itemNumber + EOLN +
									 "Description=" + itemDescription + EOLN +
									 "Quantity=" + quantity + EOLN +
									 "Price(each)=" + unitPrice + EOLN +
									 "Total=" + (quantity * unitPrice);
		if (discounted)
		  value += " (discounted)";
		if (inStock)
			value += EOLN + "In Stock" + EOLN;
		else
		  value += EOLN + "Out of Stock" + EOLN;
		return value;
	}
}
