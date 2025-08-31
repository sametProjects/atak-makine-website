import ProductList from "@/components/shared/product/product-list";
// import sampleData from "@/db/sample-data";
import { getLatestProducts } from "@/lib/actions/product.actions";

const HomePage = async () => {
  // const latestProducts = await getLatestProducts();
  //*** build de hata verdigi icin usttekini yoruma alip burayi ekledim ***
  const latestProducts = (await getLatestProducts()).map((p) => ({
    ...p,
    price: p.price.toString(),
    rating: p.rating.toString(),
  }));
  //*** build de hata verdigi icin usttekini yoruma alip burayi ekledim ***

  return (
    <div className="space-y-8">
      <h2 className="h2-bold">Latest Products</h2>
      <ProductList title="Newest Arrivals" data={latestProducts} limit={4} />
    </div>
  );
};
export default HomePage;
