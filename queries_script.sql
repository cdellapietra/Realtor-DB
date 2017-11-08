-- 1
SELECT L.address
FROM Listings L, House H
WHERE L.address = H.address;

-- 2
SELECT L.address, L.mlsNumber
FROM Listings L, House H
WHERE L.address = H.address;

-- 3
SELECT L.address
FROM Listings L, House H
WHERE L.address = H.address
AND H.bedrooms = 3 
AND H.bathrooms = 2;

-- 4
SELECT address 
FROM House
WHERE price >= 100000 
AND price <= 250000
ORDER BY price DESC;

-- 5
SELECT address, price
FROM BusinessProperty
WHERE type = 'Office Space'
ORDER BY price DESC;

-- 6
SELECT A.agentId, A.name, A.phone, F.name, A.dateStarted
FROM Agent_Firm A, Firm F
WHERE A.firmId = F.id;

--7
SELECT P.address, P.ownerName, P.price
FROM Property P, Listings L
WHERE P.address = L.address
AND L.agentId = 80808;

-- 8
SELECT A.name AS 'AGENT NAME', B.name AS 'BUYER NAME' 
FROM Works_With W, Agent_Firm A, Buyer B
WHERE W.agentID = A.agentId
AND W.buyerId = B.id;

-- 9
SELECT B.id, H.address, H.price
FROM House H, Buyer B
WHERE H.bedrooms >= B.bedrooms
AND H.bathrooms >= B.bathrooms
AND H.price <= B.maximumPreferredPrice
AND H.price >= B.minimumPreferredPrice
ORDER BY H.price DESC;
